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
; write directly to "video memory". The CPU will hook the text stored at this
; memory up to the screen. In order to do this, we'll use the mov instruction to
; put some data into the address of video memory which begins at the address, 
; 0xb8000. In this case, the text 'OK' is represented by the hex values
; 0x4f = 'O' and 0x4b = 'K'
; ==============================================================================
start:
  ; print 'OK'
  mov dword [0xb8000], 0x2f4b2f4f
  hlt