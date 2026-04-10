install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")
install.packages("scales")

library(ggplot2)
library(dplyr)
library(tidyr)
library(scales)

# PARAGRAFO 1.1
## GRAFICO A LINEE SUL CONSUMO ENERGETICO DEI DATA CENTER NEL TEMPO

long_consumo <- consumo_totale %>%
  pivot_longer(cols = c("2020", "2023", "2024", "2030", "2035"), 
    names_to = "Year", 
    values_to = "Consumption_TWh")

colnames(long_consumo)[1] <- "Region" 

long_consumo

consumo_TWh <- ggplot(long_consumo, aes(x = Year, y = Consumption_TWh, 
                                        color = Region, group = Region)) +
         geom_line(linewidth = 1) +
         geom_point(size = 2) + 
  labs(title = "Aumento del consumo energetico (TWh)", 
       subtitle = "Consumo dei data center nelle regioni nel mondo",
       x = "Anno",
       y = "Terawattora (1TWh = 1.000.000.000 KWh)") +
  theme_bw() +
  scale_color_brewer(palette = "Paired")
         
consumo_TWh 


         
## REGRESSIONE LINEARE E GRAFICO A DISPERSIONE DEL CONSUMO DI ENERGIA DEI LLM
### 'predict' per calcolare il consumo di Llama 3, DeepSeek R1 e Grok-1

reg_consumoLLM <- lm(Energy_in_Joules ~ Billions_of_parameters, data = consumo_modelli)
summary(reg_consumoLLM)

predict(reg_consumoLLM, newdata=data.frame(Billions_of_parameters = (c(405, 671, 314))),
        interval = "confidence")
predict(reg_consumoLLM, newdata=data.frame(Billions_of_parameters = (c(405, 671, 314))),
        interval = "prediction")
  
LLM_scPlot <- ggplot(llm_update, aes(y = Energy_in_Joules, 
                                     x = Billions_of_parameters, 
                                     color = Model, group = Model)) +
                    geom_point(size = 4) + 
                    labs(title = "Consumo in Joules di un LLM per query",
                    x = "Miliardi di parametri",
                    y = "Energia in Joules") +
                    theme_bw()

LLM_scPlot

# PARAGRAFO 1.2
## GRAFICO A BARRE DEL CONSUMO IDRICO

### L'EESI sostiene che un data center hyperscale può consumare fino a 19 milioni di litri d'acqua al giorno

days <- 365
water_use <- 1.9 * days
indirect_consumption <- (water_use * 60) / 100
direct_consumption <- (water_use * 40) / 100
true_consumption <- (indirect_consumption + direct_consumption) * 80 / 100

water <- data.frame(
  Consumo = c("Acqua utilizzata", "Indiretto", "Diretto", "Non riciclata"),
  Litri_milioni = c(water_use, indirect_consumption, direct_consumption, true_consumption)
)

ggplot(water, aes(x = Consumo, y = Litri_milioni, fill = Consumo)) +
  geom_col() +
  labs(title = "Previsione di consumo idrico annuale di un data center 
di grandi dimensioni",
       y = "Litri (milioni)",
       x = "Consumo") +
  theme_minimal() +
  scale_fill_manual("Legenda", values = c("Acqua utilizzata" = "blue", "Indiretto" = "lightgreen", "Diretto" = "lightblue", "Non riciclata" = "red"))

# PARAGRAFO 1.3
## Grafico a colonne sul numero di chip di IA resi operativi nel mondo

summary(chips_per_year$"Total number of AI chips")
sd(chips_per_year$"Total number of AI chips")

# Rimuovo la riga 2025
chips_per_year <- chips_per_year[-16, ]

ggplot(chips_per_year, aes(x = Year, y = `Total number of AI chips`)) +
  geom_col(fill = "steelblue") +
  labs(title = "Numero di chip AI operativi nei supercomputer per anno",
            y = "Totale chip AI",
            x = "Anno") +
  scale_x_continuous(breaks = chips_per_year$Year)+
  scale_y_continuous(labels = scales::comma) +
  theme_bw()

# PARAGRAFO 3.1
## Boxplot delle emissioni totali (dirette) del settore agroalimentare 

# sommo le quantità di emissioni per singolo anno
fao <- fao_stat %>%
  group_by(Year) %>%
  summarise(total_emissions = sum(Value))


ggplot(fao, aes(y = total_emissions)) +
  geom_boxplot(fill = "cadetblue", color = "black") +
  scale_y_log10() +
  labs(title = "Distribuzione delle emissioni totali indirette 
di CO2eq per anno (1990-2023)",
       y = "Emissioni totali") +
  theme_bw() 
  

# PARAGRAFO 3.3 
## Grafico a linee del cambiamento climatico

psych::describe(temperature_anomaly)

ggplot(temperature_anomaly, aes(x = Year, y = near_surface_temperature_anomaly,
                                group = Entity, colour = Entity)) +
  geom_line(linewidth = 0.3) +
  labs(title = "Variazione della temperatura media sulla superficie terrestre (1850-2025)",
       x = "Anno",
       y = "Variazione temperatura",
       color = "Area") +
  theme_bw()