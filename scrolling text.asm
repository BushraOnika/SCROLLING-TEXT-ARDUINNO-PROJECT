.include <avr/io.h>
.include <avr/delay.h>

.equ rs = 4    ; Pin 12
.equ en = 3    ; Pin 11
.equ d4 = 0    ; Pin 5
.equ d5 = 1    ; Pin 4
.equ d6 = 2    ; Pin 3
.equ d7 = 3    ; Pin 2

.equ lcd_data_port = PORTB    ; Port B
.equ lcd_data_dir = DDRB      ; Data Direction Register B
.equ lcd_ctrl_port = PORTD    ; Port D
.equ lcd_ctrl_dir = DDRD      ; Data Direction Register D
.equ rs_pin = 1 << rs         ; Bit mask for RS pin
.equ en_pin = 1 << en         ; Bit mask for EN pin

.def temp_reg = r16           ; Temporary register
.def i_reg = r17              ; Loop counter register

.def msg_start = r20          ; Start address of the message buffer

.section .data
msg: .db 'L','I','F','E',' ','i','s',' ','J','o','u','r','n','e','y',0

.section .text
.global main
main:
    ; Initialize LCD
    ldi temp_reg, (1 << d4) | (1 << d5) | (1 << d6) | (1 << d7)
    out lcd_data_dir, temp_reg
    ldi temp_reg, (1 << rs) | (1 << en)
    out lcd_ctrl_dir, temp_reg

    ; Set up LCD in 4-bit mode
    ldi temp_reg, 0x02
    call lcd_command

    ; Set up display parameters
    ldi temp_reg, 0x0C
    call lcd_command

    ; Print initial message
    ldi i_reg, 16
    ldi ZL, low(msg_start)
    ldi ZH, high(msg_start)
    ldi r30, 0    ; X position
    ldi r31, 0    ; Y position
    call lcd_set_cursor

print_loop:
    ld temp_reg, Z+
    call lcd_write_data
    dec i_reg
    brne print_loop

loop:
    ; Delay for 2 seconds
    ldi temp_reg, 200
    call delay_ms

    ; Shift message left
    ldi i_reg, 15
    ldi ZL, low(msg_start) + 1
    ldi ZH, high(msg_start)
    lpm temp_reg, Z
    st Z-, temp_reg

    ; Print shifted message
    ldi i_reg, 16
    ldi ZL, low(msg_start)
    ldi ZH, high(msg_start)
    ldi r30, 0    ; X position
    ldi r31, 1    ; Y position
    call lcd_set_cursor

print_shifted_loop:
    ld temp_reg, Z+
    call lcd_write_data
    dec i_reg
    brne print_shifted_loop

    rjmp loop

; Send a command to the LCD
lcd_command:
    ; Set RS low
    cbi lcd_ctrl_port, rs
    ; Set EN high
    sbi lcd_ctrl_port, en
    ; Send high nibble
    mov temp_reg,
