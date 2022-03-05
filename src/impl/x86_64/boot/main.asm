; ==============================================================================
;                               DESCRIPTION
; This file acts as the entry point into the operating system
; ==============================================================================


global start  ; declaring this as global lets us access it when linking

; ==============================================================================
;                               text
; The code section of the binary. Sets bit to a value of 32 because our
; instructions are in 32-bit mode for now.
; # TODO: Enable functionality for 64-bit mode.
; ==============================================================================
section .text
bits 32

; ==============================================================================
;                               start
; Prints 'OK' for now. In order to print characters to the screen, we must
; write directly to "video memory" due to the fact that we are in 'protected 
; mode'. The CPU will hook the text stored at this memory up to the screen. In 
; order to do this, we'll use the 'mov' instruction to put some data into the 
; address of video memory which begins at the address, 0xb8000. In this case, 
; the text 'OK' is represented by the ASCII hex values 0x4f='O' and 0x4b='K'.
; The 0x2f you see in front of each ASCII code byte represents the required 
; attribute byte for each character printed to the screen. The attribute byte 
; carries the foreground color in its lowest 4 bits and the background color in 
; its highest 3 bits. '2' represents a Green background and 'f' represents White
; text.
; ==============================================================================
start:
  ; print 'OK'
  mov dword [0xb8000], 0x2f4b2f4f
  hlt