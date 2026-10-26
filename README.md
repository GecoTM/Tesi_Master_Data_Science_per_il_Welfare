# Il doppio volto dell’IA: impatti ambientali e nuove opportunità sostenibili

Tesi del Master in Data Science per il Welfare — Università del Salento, Dipartimento di Scienze Umane e Sociali, A.A. 2025/2026.

Autore: Jacopo Timo · Relatore: Prof. Angelo Coluccia

📄 Testo completo: Il doppio volto dell'IA.pdf

Sintesi

L’intelligenza artificiale si sta diffondendo rapidamente e solleva domande sul suo impatto ambientale. La tesi ne analizza la natura ambivalente: da un lato l’espansione dei data center aumenta il consumo di elettricità e di acqua, l’estrazione di minerali, i rifiuti elettronici e le emissioni; dall’altro l’IA può sostenere la transizione ecologica, per esempio in agricoltura, nelle reti elettriche intelligenti e nel monitoraggio del clima.

La parte quantitativa è un’analisi esplorativa dei dati (EDA) su fonti di organizzazioni internazionali (IEA, FAO, ICMM) e su dati aperti.

Summary (EN). Master’s thesis (in Italian) on the two faces of AI with respect to the environment: the resource footprint of AI infrastructure (electricity, water, minerals, e-waste, emissions) and AI as a tool for sustainability (smart agriculture, smart grids, climate monitoring). This repository contains the thesis PDF, a Python/pandas notebook for data preparation, an R/ggplot2 script that produces the charts, and the datasets used in the exploratory analysis.

Struttura della tesi
Capitolo I — Il rapporto tra IA e ambiente: introduzione e metodologia
Capitolo II — L’impatto ambientale dell’intelligenza artificiale
2.1 Elettricità
2.2 Acqua
2.3 Dall’estrazione di minerali all’e-waste
2.4 Emissioni di gas serra
Capitolo III — L’IA come strumento per la salvaguardia dell’ambiente
3.1 Agricoltura intelligente
3.2 Smart grid
3.3 Monitoraggio del clima
Conclusioni
Metodologia

L’analisi è esplorativa e descrittiva, su dati quantitativi. Il flusso di lavoro ha due fasi:

Preparazione dei dati in Python (pandas, Jupyter Notebook): pulizia, filtri, trasformazioni e aggregazioni.
Rappresentazione grafica e calcoli statistici in R (ggplot2, dplyr, tidyr, scales): grafici per i paragrafi della tesi e una regressione lineare semplice sul consumo energetico dei modelli linguistici.
Contenuto del repository
.
├── README.md
├── Il doppio volto dell'IA.pdf      # testo della tesi
├── analisi_tesi.ipynb               # preparazione dei dati (Python / pandas)
├── grafici_tesi.R                   # grafici e calcoli statistici (R)
└── Dataset_da_analizzare/           # dati di partenza
    ├── AI_Supercomputers.csv
    ├── AI_Sustainability_Dataset.csv
    ├── ICMM_siti_minerari.xlsx
    ├── IEA_Energy_AI.xlsx
    ├── fao_stat.csv
    └── temperature-anomaly.csv
Dati e fonti
File	Contenuto	Uso nel codice	Fonte e licenza
IEA_Energy_AI.xlsx	Consumo elettrico dei data center per regione, con scenari al 2030 e al 2035	I valori usati sono inseriti manualmente nel notebook, non letti dal file	IEA (Energy and AI)
ICMM_siti_minerari.xlsx	Siti minerari nel mondo (foglio External)	Filtrati per affidabilità alta, tipo “Mine” e materia prima principale: rame, oro, argento, litio, nichel	ICMM (International Council on Mining and Metals)
AI_Supercomputers.csv	Supercomputer per l’IA: stato, data di entrata in funzione, numero di chip	Si escludono le strutture solo pianificate e quelle senza numero di chip o data; i chip sono sommati per anno (2010–2025)	[fonte e licenza da indicare]
fao_stat.csv	Emissioni (CO2eq, kt) della produzione agricola, fasi pre e post produzione, 1990–2023	Somma annuale delle emissioni	FAOSTAT (FAO)
temperature-anomaly.csv	Anomalia della temperatura media vicino alla superficie, per area, dal 1850	Letto in R per il grafico del paragrafo 3.3	[fonte e licenza da indicare]
AI_Sustainability_Dataset.csv	Applicazioni dell’IA alla sostenibilità con indicatori di impatto	Non utilizzato dal notebook né dallo script	[fonte e licenza da indicare]

I consumi energetici per query dei modelli linguistici e i parametri dei modelli sono inseriti manualmente nel notebook. I dataset restano soggetti alle licenze dei rispettivi titolari: consulta le fonti originali prima di riutilizzarli.

Analisi svolte
Paragrafo	Analisi	Dove
2.1 Elettricità	Consumo elettrico dei data center per regione, con lo scenario accelerato dell’IEA (1264 TWh nel mondo al 2030, 1719 TWh al 2035)	notebook + R
2.1 Elettricità	Energia per query in funzione del numero di parametri di 13 modelli linguistici: regressione lineare e stime per modelli più grandi (Grok-1, Llama 3 da 405 miliardi di parametri, DeepSeek-V3)	R
2.2 Acqua	Grafico a barre di una stima illustrativa del consumo idrico annuale di un data center di grandi dimensioni, con quote diretta, indiretta e non recuperata secondo l’EESI	R
2.3 Minerali ed e-waste	Paesi con più siti minerari ad alta affidabilità per rame, oro, argento, litio e nichel	notebook
2.3 Minerali ed e-waste	Chip per l’IA resi operativi ogni anno nei supercomputer	notebook + R
3.1 Agricoltura	Distribuzione delle emissioni annuali totali del settore agroalimentare, 1990–2023, su scala logaritmica	notebook + R
3.3 Clima	Anomalia della temperatura media dal 1850 per area	R
Come eseguire il progetto

Requisiti

Python 3 con pandas, numpy, openpyxl e Jupyter
R con i pacchetti ggplot2, dplyr, tidyr, scales e psych

Passi

Clona il repository ed entra nella cartella.
Apri analisi_tesi.ipynb e, nelle celle che leggono i dati con pd.read_excel o pd.read_csv, sostituisci il percorso assoluto con Dataset_da_analizzare/<nome del file>.
Esegui tutte le celle. Il notebook genera consumo_totale.csv, consumo_modelli.csv, llm_update.csv, chips_per_year.csv e fao.csv.
In R, dalla cartella del repository, carica gli oggetti usati dallo script e poi esegui grafici_tesi.R:
r
consumo_totale  <- read.csv("consumo_totale.csv",  check.names = FALSE)
consumo_modelli <- read.csv("consumo_modelli.csv")
llm_update      <- read.csv("llm_update.csv")
chips_per_year  <- read.csv("chips_per_year.csv",  check.names = FALSE)
fao_stat        <- read.csv("Dataset_da_analizzare/fao_stat.csv", fileEncoding = "UTF-8-BOM")
temperature_anomaly <- read.csv("Dataset_da_analizzare/temperature-anomaly.csv")

source("grafici_tesi.R")
Assunzioni e limiti
Analisi descrittiva. I risultati descrivono i dati disponibili e non stabiliscono rapporti di causa ed effetto.
Scenario IEA per regione. Per il 2030 e il 2035 il notebook applica a ogni regione lo stesso tasso di crescita del totale mondiale dello scenario accelerato (moltiplicatore 1264/416 per il 2030, poi 1,36 per il 2035). I valori regionali sono quindi stime proporzionali e non i valori regionali pubblicati dall’IEA.
Stime per i modelli più grandi. La regressione è calcolata su modelli fino a 141 miliardi di parametri. Le stime per Grok-1, Llama 3 e DeepSeek-V3 sono estrapolazioni fuori dall’intervallo osservato e vanno lette come indicative.
Anno 2025. Nel grafico dei chip per anno lo script esclude il 2025.
Dati inseriti a mano. I consumi energetici e i parametri dei modelli sono trascritti nel notebook da fonti secondarie.
Come citare

Timo J., Il doppio volto dell’IA: impatti ambientali e nuove opportunità sostenibili, Tesi del Master in Data Science per il Welfare, Università del Salento, A.A. 2025/2026.

Contatti

LinkedIn — Jacopo Timo
