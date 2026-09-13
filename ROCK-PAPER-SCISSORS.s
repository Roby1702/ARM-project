.equ ADDR_7SEG1, 0xFF200020     
.equ ADDR_7SEG2, 0xFF200030     
.equ SWITCH_BASE, 0xFF200040    
.equ TIMER_BASE, 0xFFFEC600     
.equ TIMER_VALUE, 0xFFFEC604    
.equ TIMER_CONTROL, 0xFFFEC608  
.equ PUSH_BUTTONS, 0xFF200050   


.data                            

SCF:                             
    .word 0b01101101             // S
    .word 0b00111001             // C
    .word 0b01110001             // F

VINCITORE:                      
    .word 0b01010000             
    .word 0b01111100            

SEGMENTI_NUM:                    
    .word 0b00111111             
    .word 0b00000110             
    .word 0b01011011             
    .word 0b01001111             
    .word 0b01100110            
    .word 0b01101101             
    .word 0b01111101             
    .word 0b00000111             
    .word 0b01111111             
    .word 0b01101111             

punteggio_GIOCATORE:       
    .word 0
punteggio_BOT:              
    .word 0

partite_vinte_GIOCATORE: 
	.word 0
partite_vinte_BOT: 
	.word 0

scelta_GIOCATORE:           
    .word 0
scelta_BOT:                
    .word 0

.text                         
.global _start

_start:

//VGA BLOCCO

//PAROLA: (X,Y)= X+(Y*128)


//--------------------SASSO-------------------------- 

	LDR R1, =0xC9000000
	MOV R3, #0x53
	LDR R2, =0x399
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x41
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x53
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x53
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4F
	STRB R3,[R1,R2]
	
//--------------------CARTA-------------------------- 
	
	ADD R2,R2,#1
	MOV R3, #0x43
	LDR R2, =0x39F
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x41
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x52
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x54
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x41
	STRB R3,[R1,R2]
	
//--------------------FORBICI-------------------------- 
	
	ADD R2,R2,#1
	MOV R3, #0x46
	LDR R2, =0x3A5
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4F
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x52
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x42
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x49
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x43
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x49
	STRB R3,[R1,R2]
	
//--------------------PUNTEGGIO-------------------------- 
	
	MOV R3, #0x50
	LDR R2, =0x687
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x55
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4E
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x54
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x45
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x47
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x47
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x49
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4F
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x3A
	STRB R3,[R1,R2]
	
//--------------------GIOCATORE-------------------------- 
	
	MOV R3, #0x47
	LDR R2, =0x987
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x49
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4F
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x43
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x41
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x54
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4F
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x52
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x45
	STRB R3,[R1,R2]
	
	ADD R2,R2,#2
	MOV R3, #0x5B
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x52
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4F
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x42
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x79
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x5D
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x3A
	STRB R3,[R1,R2]
	
//--------------------BOT-------------------------- 
	
	MOV R3, #0x42
	LDR R2, =0xB87
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4F
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x54
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x3A
	STRB R3,[R1,R2]
	
//--------------------MENU A TENDINA-------------------------- 
	
	MOV R3, #0x42
	LDR R2, =0xF03
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x45
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4E
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x56
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x45
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4E
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x55
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x54
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4F
	STRB R3,[R1,R2]
	
	
	ADD R2,R2,#2
	MOV R3, #0x47
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x49
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4F
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x43
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x41
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x54
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4F
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x52
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x45
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x3A
	STRB R3,[R1,R2]
	
//--------------------PULSANTE 0-------------------------- 
	
	MOV R3, #0x2D
	LDR R2, =0x1107
	STRB R3,[R1,R2]
	
	ADD R2,R2,#2
	MOV R3, #0x50
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x55
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4C
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x53
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x41
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4E
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x54
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x45
	STRB R3,[R1,R2]
	
	ADD R2,R2,#2
	MOV R3, #0x30
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x3A
	STRB R3,[R1,R2]
	
	
	ADD R2,R2,#2
	MOV R3, #0x41
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x56
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x56
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x49
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x41
	STRB R3,[R1,R2]
	
	
	ADD R2,R2,#2
	MOV R3, #0x49
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4C
	STRB R3,[R1,R2]
	
	
	ADD R2,R2,#2
	MOV R3, #0x52
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4F
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x55
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4E
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x44
	STRB R3,[R1,R2]
	
//--------------------PULSANTE 1-------------------------- 
	
	MOV R3, #0x2D
	LDR R2, =0x1287
	STRB R3,[R1,R2]
	
	ADD R2,R2,#2
	MOV R3, #0x50
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x55
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4C
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x53
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x41
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4E
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x54
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x45
	STRB R3,[R1,R2]
	
	ADD R2,R2,#2
	MOV R3, #0x31
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x3A
	STRB R3,[R1,R2]
	
	ADD R2,R2,#2
	MOV R3, #0x52
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4F
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x55
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4E
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x44
	STRB R3,[R1,R2]
	
	
	ADD R2,R2,#2
	MOV R3, #0x53
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x55
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x43
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x43
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x45
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x53
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x53
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x49
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x56
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4F
	STRB R3,[R1,R2]
	
//--------------------PULSANTE 2-------------------------- 
	
	MOV R3, #0x2D
	LDR R2, =0x1407
	STRB R3,[R1,R2]
	
	ADD R2,R2,#2
	MOV R3, #0x50
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x55
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4C
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x53
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x41
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4E
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x54
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x45
	STRB R3,[R1,R2]
	
	ADD R2,R2,#2
	MOV R3, #0x32
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x3A
	STRB R3,[R1,R2]
	
	ADD R2,R2,#2
	MOV R3, #0x52
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x45
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x53
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x45
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x54
	STRB R3,[R1,R2]
	
//--------------------PULSANTE 3-------------------------- 
	
	MOV R3, #0x2D
	LDR R2, =0x1587
	STRB R3,[R1,R2]
	
	ADD R2,R2,#2
	MOV R3, #0x50
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x55
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4C
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x53
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x41
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4E
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x54
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x45
	STRB R3,[R1,R2]
	
	ADD R2,R2,#2
	MOV R3, #0x33
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x3A
	STRB R3,[R1,R2]
	
	
	ADD R2,R2,#2
	MOV R3, #0x52
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x49
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x43
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4F
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4D
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x49
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4E
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x43
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x49
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x41
	STRB R3,[R1,R2]
	
	
	ADD R2,R2,#2
	MOV R3, #0x49
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4C
	STRB R3,[R1,R2]
	
	
	ADD R2,R2,#2
	MOV R3, #0x47
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x49
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4F
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x43
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4F
	STRB R3,[R1,R2]
	
	
	ADD R2,R2,#2
	MOV R3, #0x44
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4F
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x50
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4F
	STRB R3,[R1,R2]
	
	
	ADD R2,R2,#2
	MOV R3, #0x49
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4C
	STRB R3,[R1,R2]
	
	
	ADD R2,R2,#2
	MOV R3, #0x52
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x49
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x53
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x55
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4C
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x54
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x41
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x54
	STRB R3,[R1,R2]
	
	ADD R2,R2,#1
	MOV R3, #0x4F
	STRB R3,[R1,R2]

    BL avvio           
    BL timer 			    
	
main:                       
    BL lettura_input_GIOCATORE  
    
	LDR r1, =PUSH_BUTTONS        
    LDR r0, [r1]                
    AND r0, r0, #0x1             
    CMP r0, #0                  
    BEQ main               
    
	BL valore_timer         
	BL display_SCELTE          
    BL vincitore            
    BL display_PUNTEGGIO     
    BL game_vincitore            
    BL attesa_del_round_successivo     
    B main                  

avvio:
   
    MOV r0, #0
    LDR r2, =SEGMENTI_NUM         
    LDR r2, [r2, r0, LSL #2]     
    
	LDR r1, =ADDR_7SEG2         
    ORR r0, r0, r2, LSL #8      
    ORR r0, r0, r2
    STR r0, [r1]                 
	
	LDR r1, =ADDR_7SEG1        
	LDR r2, =0b00001000         
	MOV r0, #0
	ORR r0,r0,r2, LSL #8        
	ORR r0,r0,r2
	STR r0, [r1]                 
    BX lr                      

timer:                
    LDR r1, =TIMER_BASE         
    LDR r0, =0xFFFFFFFF          
    STR r0, [r1]                 
    							
	MOV r0, #3                  
    LDR r1, =TIMER_CONTROL       
    STR r0, [r1]                 
    BX lr                        

lettura_input_GIOCATORE:         
    
	PUSH {r4, lr}               
    LDR r1, =SWITCH_BASE         
    LDR r0, [r1]                 
    AND r0, r0, #0x7             
    
	MOV r2, r0                   
    LDR r1, =scelta_GIOCATORE    
    STR r2, [r1]                
    POP {r4, lr}                
    BX lr                       

valore_timer:                 
    
	PUSH {r4, lr}               
    LDR r1, =TIMER_VALUE         
    LDR r0, [r1]                
    AND r0, r0, #0xF             
    							
							
	
	CMP r0, #5                  
    BLT scelta_sasso             
	
    CMP r0, #10                 
    BLT scelta_carta             
	
    CMP r0, #15                 
    BLT scelta_forbici        
	
    B valore_timer            



scelta_sasso:                 
    
	MOV r0, #0                  
    LDR r1, =scelta_BOT      
    STR r0, [r1]                
    POP {r4, lr}                 
    BX lr                       

scelta_carta:               
   
    MOV r0, #1              
    LDR r1, =scelta_BOT     
    STR r0, [r1]            
    POP {r4, lr}            
    BX lr                   

scelta_forbici:                 
    
	MOV r0, #2                   
    LDR r1, =scelta_BOT      
    STR r0, [r1]              
    POP {r4, lr}              
    BX lr                      



display_SCELTE:                
    
	PUSH {lr}                    
    LDR r1, =scelta_GIOCATORE    
    LDR r2, [r1]                 
    LDR r3, =SCF                 
                                 
    CMP r2, #1                   
    BEQ display_SASSO_GIOCATORE  
    
	CMP r2, #2                   
    BEQ display_CARTA_GIOCATORE  
    
	CMP r2, #4                    
    BEQ display_FORBICI_GIOCATORE        
    
	B prossimo_round    		 

display_SASSO_GIOCATORE:         
    
	LDR r1, [r3]               
    B display_SCELTE_BOT    	 
	
display_CARTA_GIOCATORE:        
    
	LDR r1, [r3, #4]            
    B display_SCELTE_BOT    	

display_FORBICI_GIOCATORE:       
    
	LDR r1, [r3, #8]             
    B display_SCELTE_BOT     	

prossimo_round:          
    
	POP {lr}                     
    BX lr                       

display_SCELTE_BOT:          	 
    
	LDR r2, =scelta_BOT      	 
    LDR r0, [r2]                 
    
	CMP r0, #0                   
    BEQ display_SASSO_BOT       
    
	CMP r0, #1                   
    BEQ display_CARTA_BOT       
    
	CMP r0, #2                   
    BEQ display_FORBICI_BOT      
    
	B clear_display_BOT      

display_SASSO_BOT:               
    
	LDR r2, [r3]                 
    B display_G_B        	

display_CARTA_BOT:               
    
	LDR r2, [r3, #4]             
    B display_G_B        	

display_FORBICI_BOT:            
    
	LDR r2, [r3, #8]            
    B display_G_B       		 

clear_display_BOT:           	 
    
	MOV r2, #0                   
    B display_G_B        		

display_G_B:           			
    
	LDR r3, =ADDR_7SEG1           
    MOV r0, #0                    
    ORR r0, r0, r1               
    ORR r0, r0, r2, LSL #8        
    STR r0, [r3]                  
    POP {lr}                      
    BX lr                         


vincitore:                  	
    
	PUSH {r4, r5, lr}            

    LDR r1, =scelta_GIOCATORE     
    LDR r2, [r1]                 
    B scelte_confronto            

scelte_confronto:               
    
	LDR r1, =scelta_BOT          
    LDR r0, [r1]                
    CMP r2, #1                   
	BEQ sasso                     
    
	CMP r2, #2                   
	BEQ carta                   
    
	CMP r2, #4                   
    BEQ forbici             

sasso:                           
    
	CMP r0, #0                  
    BEQ pareggio                    
    CMP r0, #1                   
    BEQ punti_BOT            
    CMP r0, #2                  
    BEQ punti_GIOCATORE      

carta:                          
    
	CMP r0, #0                 
    BEQ punti_GIOCATORE     
    CMP r0, #1                   
    BEQ pareggio                      
    CMP r0, #2                   
    BEQ punti_BOT            

forbici:                        
    
	CMP r0, #0                   
    BEQ punti_BOT            
    CMP r0, #1                   
    BEQ punti_GIOCATORE      
    CMP r0, #2                   
    BEQ pareggio                 

pareggio:                     
    
	POP {r4, r5, lr}          
    BX lr                        

punti_BOT:                  
    
	LDR r1, =punteggio_BOT       
    LDR r0, [r1]                 
    ADD r0, r0, #1             
    STR r0, [r1]                
    POP {r4, r5, lr}          
    BX lr                       

punti_GIOCATORE:                     
    
	LDR r1, =punteggio_GIOCATORE    
    LDR r0, [r1]                 
    ADD r0, r0, #1               
    STR r0, [r1]                 
    POP {r4, r5, lr}             
    BX lr                        

display_PUNTEGGIO:               

    PUSH {r4, r5, lr}           

    LDR r1, =punteggio_GIOCATORE    
    LDR r0, [r1]                 
    LDR r2, =SEGMENTI_NUM            
    LDR r4, [r2, r0, LSL #2]     

    LDR r1, =punteggio_BOT        
    LDR r0, [r1]                 
    LDR r2, =SEGMENTI_NUM           
    LDR r5, [r2, r0, LSL #2]     

    LDR r1, =ADDR_7SEG2          
    MOV r0, #0                   
    ORR r0, r0, r4              
    ORR r0, r0, r5, LSL #8       
    STR r0, [r1]                 

    POP {r4, r5, lr}           
    BX lr                        

attesa_del_round_successivo:    
    
	LDR r1, =PUSH_BUTTONS       

attesa_del_loop:                 
    
	LDR r0, [r1]               
    AND r0, r0, #0x2             
    CMP r0, #0x2                
    BEQ continua_gioco           
    LDR r2, [r1]                 
    AND r2, r2, #0x4             
    CMP r2, #0x4                
    BEQ reset          

    B attesa_del_loop                  
	
continua_gioco:                  
    
	BX lr                        

reset:                   

    LDR r1, =punteggio_GIOCATORE   
    MOV r0, #0                   
    STR r0, [r1]                 
    LDR r1, =punteggio_BOT        
    STR r0, [r1]                 
    B avvio               

game_vincitore:                     
    
	LDR r1, =punteggio_GIOCATORE     
    LDR r0, [r1]                
    MOV r3, #3                  
    CMP r0, r3                   
    
	BNE controlla_bot  
	
	LDR r4, =partite_vinte_GIOCATORE
	LDR r5, [r4]
	ADD r5, r5, #1
	STR r5, [r4]
	
	ADD r6, r5, #0x30        
	LDR r7, =0xC9000000      
	LDR r8, =0x999           
	STRB r6, [r7, r8]        
	
	
	BEQ vincite_GIOCATORE                
    
	
controlla_bot:
	
	
	LDR r1, =punteggio_BOT       
    LDR r0, [r1]                 
    CMP r0, r3                   
    BNE nessun_vincitore

	
	LDR r4, =partite_vinte_BOT
	LDR r5, [r4]
	ADD r5, r5, #1
	STR r5, [r4]

	
	ADD r6, r5, #0x30         
	LDR r7, =0xC9000000     
	LDR r8, =0xB8C           
	STRB r6, [r7, r8]        


	LDR r1, =punteggio_BOT
	LDR r0, [r1]

	B vincite_BOT

nessun_vincitore:               

    BX lr                        

vincite_GIOCATORE:              

	LDR r1, =VINCITORE        
    LDR r0, [r1]                 
    LDR r1, =ADDR_7SEG1        
    LDR r2, [r1]                 
    //ORR r2, r2, r0, LSL #16       
    STR r2, [r1]                 

 
	
    LDR r1, =punteggio_GIOCATORE     
    MOV r0, #0                       
    STR r0, [r1]                     
    LDR r1, =punteggio_BOT          
    STR r0, [r1]                	
    LDR r1, =PUSH_BUTTONS        	
    LDR r0, [r1]                	 
    AND r0, r0, #0x8            	 
    CMP r0, #0                    
    BEQ vincite_GIOCATORE              	 

    B _start                     

vincite_BOT:                     
    
	LDR r1, =VINCITORE              
    LDR r0, [r1, #4]            
    LDR r1, =ADDR_7SEG1          
    LDR r2, [r1]                 
    //ORR r2, r2, r0, LSL #16      
    STR r2, [r1]                 

    
    LDR r1, =punteggio_GIOCATORE          
    MOV r0, #0                   
    STR r0, [r1]                
    LDR r1, =punteggio_BOT       
    STR r0, [r1]                 
    LDR r1, =PUSH_BUTTONS        
    LDR r0, [r1]                 
    AND r0, r0, #0x8             
    CMP r0, #0                  
    BEQ vincite_BOT             

    B _start                     