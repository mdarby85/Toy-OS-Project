; =============================DESCRIPTION======================================
; Inside this assembly file we are going to be adding in some data which is to 
; be included in the operating system binary. This magic data is necessary so 
; that bootloaders can understand that we have an operating system here that 
; can be run on your computer. As you may know, the operating system isn't 
; actually the first thing that starts on the computer, but rather the 
; bootloader is. The core responsibility for a bootloader is to locate an 
; operating system in whatever way appropriate to the specific computer. So 
; whether that be somewhere on your hard drive or on a usb drive or maybe on a
; cd. Once the bootloader has found any operating systems it will be able to 
; start them. So we're going to be following the multiboot2 specification which 
; most bootloaders support. We create two labels to define the start and the end
; of our header. Anything in between here will be our header data.
; ==============================================================================

section .multiboot_header
header_start:
  ; =============================magic number===================================
  ; Initially we're going to need to put in a magic number that multiboot2 will 
  ; look for. We can use dd to add in the data of this magic number.

  dd 0xe85250d6  ; multiboot2's magic number

  ; =============================architecture===================================
  ; Next we need to specify some information about the architecture of our 
  ; operating system and we'll just put in zero and this means protected mode
  ; i386

  dd 0  ; protected mode i386

  ; ============================header length===================================
  ; The next piece of data we need is the length of our header. Since we have 
  ; these two labels here we can use them to programmatically calculate the 
  ; length of the header. We can do that by subtracting the header_end minus 
  ; header_start.

  dd header_end - header_start

  ; ===============================checksum=====================================
  ; Finally we need a checksum. This is calculated as one followed by eight 
  ; zeros minus the sum of all the data we have in our header in the previous 
  ; sections above (magic number + architecture + header length).

  dd 0x100000000 - (0xe85250d6 + 0 + (header_end - header_start))

  ; ===============================end tag======================================
  ; Lastly, we need to add in an end tag with two dws and one dd just to say 
  ; that we don't have any more data
  
  dw 0
  dw 0
  dd 8

header_end: