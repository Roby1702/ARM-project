# 🪨 📄 ✂️ Rock-Paper-Scissors (ARM Assembly - DE1-SoC)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Architecture](https://img.shields.io/badge/Architecture-ARMv7--A-blue.svg)](#)
[![Target Platform](https://img.shields.io/badge/Platform-Intel%20DE1--SoC-orange.svg)](#)

Un'implementazione completa del classico gioco **Morra Cinese (Sasso-Carta-Forbici)** scritta interamente in **ARM Assembly**, progettata per la scheda di sviluppo **Altera/Intel DE1-SoC** (processore ARM Cortex-A9).

Il progetto interagisce direttamente con le periferiche hardware a basso livello, gestendo:
* **Interfaccia Video VGA** per la stampa di testo ed istruzioni a schermo.
* **Display a 7 Segmenti** per visualizzare le scelte grafiche dei giocatori ed i punteggi.
* **Switch e Pulsanti (Key)** per la selezione della mossa e la gestione del flusso di gioco.
* **Private Timer Hardware** per la generazione di numeri pseudo-casuali (scelta del BOT).

---

## 📌 Indice
- [Descrizione del Progetto](#-descrizione-del-progetto)
- [Mappatura Periferiche Hardware](#-mappatura-periferiche-hardware)
- [Architettura del Codice e Spiegazione Passo-Passo](#-architettura-del-codice-e-spiegazione-passo-passo)
  - [1. Definizione Costanti e Memoria Data](#1-definizione-costanti-e-memoria-data)
  - [2. Inizializzazione VGA Text Buffer](#2-inizializzazione-vga-text-buffer)
  - [3. Gestione Timer e Generazione Scelta BOT](#3-gestione-timer-e-generazione-scelta-bot)
  - [4. Lettura Input e Logica di Gioco](#4-lettura-input-e-logica-di-gioco)
  - [5. Visualizzazione su Display a 7 Segmenti](#5-visualizzazione-su-display-a-7-segmenti)
- [Come Compilare ed Eseguire](#-come-compilare-ed-eseguire)
- [Autore](#-autore)


## ℹ️ Descrizione del Progetto

Il gioco si svolge in una sfida tra l'**Utente** ed un **BOT**.

1. **Selezione Mossa:** L'utente seleziona la propria mossa tramite gli **Switch** hardware:
   * `SW0` (0x1) = **Sasso** 🪨
   * `SW1` (0x2) = **Carta** 📄
   * `SW2` (0x4) = **Forbici** ✂️
2. **Conferma:** L'utente preme il pulsante `KEY0` per confermare la scelta.
3. **Mossa del BOT:** Il sistema calcola la scelta del BOT leggendo il registro di conteggio attuale del **Private Timer**, mappando il valore su una delle tre opzioni possibili.
4. **Visualizzazione:** Le mosse (simboli `S`, `C`, `F`) appaiono sui primi due display a 7 segmenti (`HEX0` e `HEX1`), mentre il punteggio corrente compare su `HEX2` e `HEX3`.
5. **Vittoria:** Il primo giocatore che raggiunge 3 punti vince la partita. Sul monitor VGA vengono aggiornate le vittorie complessive registrate.



## 🛠️ Mappatura Periferiche Hardware

| Periferica | Indirizzo Base (Memory Map) | Descrizione |
| :--- | :--- | :--- |
| **7-Segment Display (HEX0 - HEX3)** | `0xFF200020` / `0xFF200030` | Visualizzazione simboli e punteggi |
| **Slide Switches (SW)** | `0xFF200040` | Lettura input mossa dell'utente |
| **Push Buttons (KEY)** | `0xFF200050` | Avanzamento round / Reset |
| **MPCore Private Timer** | `0xFFFEC600` | Base tempo e generatore casuale |
| **VGA Character Buffer** | `0xC9000000` | Memoria testo per schermo VGA |

---

## 📖 Architettura del Codice e Spiegazione Passo-Passo

Il file `ROCK-PAPER-SCISSORS.s` è strutturato secondo la seguente organizzazione:

### 1. Definizione Costanti e Memoria Data
Nella sezione `.data` vengono definiti i pattern binari necessari all'accensione dei segmenti per visualizzare le lettere **S**, **C**, **F** e i numeri da `0` a `9`, oltre alle variabili di memoria per i punteggi:
```assembly
SCF:

    .word 0b01101101    // Codifica 7-segmenti per 'S' (Sasso)
    .word 0b00111001    // Codifica 7-segmenti per 'C' (Carta)
    .word 0b01110001    // Codifica 7-segmenti per 'F' (Forbici)
```
### 2. Inizializzazione VGA Text Buffer
La routine iniziale `_start` scrive direttamente nel character buffer della VGA (`0xC9000000`). Utilizzando la formula d'indirizzamento offset `Offset = X + (Y * 128)`, vengono scritte le stringhe dell'interfaccia utente:
* Titoli delle scelte: `SASSO`, `CARTA`, `FORBICI`
* Punteggio e diciture: `PUNTEGGIO:`, `GIOCATORE`, `BOT`
* Istruzioni per i pulsanti (`KEY0` per confermare, `KEY1` per prossimo round, `KEY2` per reset).

### 3. Gestione Timer e Generazione Scelta BOT
La routine `timer` inizializza il registro del Private Timer al valore massimo `0xFFFFFFFF` facendolo decrementare continuamente:

```assembly
valore_timer:
    LDR r1, =TIMER_VALUE
    LDR r0, [r1]
    AND r0, r0, #0xF    // Isola gli ultimi 4 bit del contatore (valori 0-15)
    
    CMP r0, #5
    BLT scelta_sasso    // 0..4  -> Sasso (0)
    CMP r0, #10
    BLT scelta_carta    // 5..9  -> Carta (1)
    CMP r0, #15
    BLT scelta_forbici  // 10..14 -> Forbici (2)

```
### 4. Lettura Input e Logica di Gioco
* **`lettura_input_GIOCATORE`**: Maschera i primi 3 bit degli switch (`0x7`) per determinare se il giocatore ha selezionato Sasso, Carta o Forbici.
* **`vincitore`**: Confronta le scelte secondo le regole classiche (Sasso batte Forbici, Carta batte Sasso, Forbici batte Carta) e aggiorna i punteggi.

### 5. Visualizzazione su Display a 7 Segmenti
* **`display_SCELTE`**: Carica i pattern dei segmenti in base alle mosse scritte in memoria e li invia a `HEX0` e `HEX1`.
* **`display_PUNTEGGIO`**: Converte i punteggi numerici correnti e li invia a `HEX2` e `HEX3`.


## ⚙️ Come Compilare ed Eseguire

### Prerequisiti
* **Intel FPGA Monitor Program** oppure il simulatore **CPUlator** (DE1-SoC System).
* Toolchain **ARM GNU Toolchain**.

### Passaggi
1. Apri CPUlator o Altera Monitor Program e seleziona **ARMv7-A (DE1-SoC)**.
2. Carica il file Black VGA ed esegui.
3. Carica il file `ROCK-PAPER-SCISSORS.s`.
4. Compila e carica nella memoria del simulatore.
5. Avvia l'esecuzione (`Run`).
6. Imposta gli **Switch (SW0, SW1, SW2)** e premi `KEY0` per giocare.

## 👨‍💻 Autore

Progetto realizzato in **ARM Assembly** per il corso di studi in Ingegneria Informatica.

* 💻 **GitHub:** [@Roby1702]([https://github.com/tuo-username](https://github.com/Roby1702))
* 🌐 **LinkedIn:** [Roberto Barra]([https://linkedin.com/in/tuo-profilo](https://www.linkedin.com/in/robertobarra/))
