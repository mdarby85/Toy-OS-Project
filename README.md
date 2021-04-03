# Toy 64-bit Operating System From Scratch <!-- omit in toc -->

___

- [1. Introduction](#1-introduction)
  - [1.2 Background](#12-background)
    - [1.2.1 x86 Assembly](#121-x86-assembly)
      - [1.2.1.1 Registers](#1211-registers)
      - [1.2.1.2 Instructions Used](#1212-instructions-used)
- [2. Architecture](#2-architecture)
  - [2.1 Multiboot2](#21-multiboot2)
  - [2.2 Understanding x86 vs x86-64](#22-understanding-x86-vs-x86-64)
  - [2.3 Endianness](#23-endianness)
- [3. Setup](#3-setup)
  - [3.1 Development Environment](#31-development-environment)


# 1. Introduction

- They say there are three things you have to do before you die: Write a book, have a child, and plant a tree. Those people are wrong. That list is actually 4 things long: Code your own bot, create a massive, useless framework that only you will ever use, write your own Linux kernel module, and create your own Operating System. Well, I've already built a couple of bots and, at least for now, one of those useless frameworks. After all, those aren't too bad since they're both well-suited for Python or Javascript. However, the last two on that list are gonna require you to use C :stuck_out_tongue:

## 1.2 Background

- This is an experimental project I'm working on to build my own Operating System for the purposes of expanding upon my low-level programming/engineering skills. I want to do this totally from scratch using barebones C and Assembly where I need it.

### 1.2.1 x86 Assembly

#### 1.2.1.1 Registers

- `eax - accumulator`
- `ebx - base`
- `ecx - counter`
- `edx - data`

#### 1.2.1.2 Instructions Used

  In this section I will list any x86 instructions I used in this project and provide an explanation of each. Keep in mind that examples are shown in **little-endian** as that is how the Intel x86 and AMD64/x86-64 series of processors are interpreted.

- `dw` = Define word. Generally 2 bytes on a typical x86 32-bit system.
  Ex: `dw 0x1234  ; 0x34 0x12`
- `dd` = Define double word. Generally 4 bytes on a typical x86 32-bit system.
  Ex: `dd 0x12345678  ; 0x78 0x56 0x34 0x12`
  
# 2. Architecture

## 2.1 Multiboot2

- I will start off by making an x86 compatible OS which is multiboot2 compliant.

## 2.2 Understanding x86 vs x86-64

- >In current terminology x86 normally indicates 32-bits, with x86-64 or x64 indicating 64-bits.
    >x86 really refers to an instruction set based on the Intel 8086 (from some time ago - 1973 by Wikipedia's reckoning). Nowadays this normally is taken to simply mean a 32-bit instruction set. Initally it was a set of instructions that operated with only 16-bit, so historically could be referred to as x86-16 or x86-32. But, obviously, x86-16 is no longer relevant as 16-bit processors died out a long time ago.
    >x86-64 (or just x64) is an extension to the x86 instruction set, providing support for 64-bit registers, memory space and the like. It is fully backwards compatible with the 32-bit x86 instruction set (allowing 32-bit software to be compatabile without modification in most cases) and is taken to simply mean a 64-bit instruction set.
    >There are vendor-specific names for x86-64 as well - it can be referred to AMD64 or Intel 64 (previous IA-32e and EM64T).
- [Source](https://superuser.com/a/186544)

## 2.3 Endianness

- The Intel x86 and AMD64 / x86-64 series of processors use the little-endian (LE) format.

# 3. Setup

## 3.1 Development Environment

- Visual Studio Code
- Docker
  - We're gonna take advantage of Docker to install GRUB, Netwide Assembler (NASM), and the specific gcc cross-compiler, gcc-cross-x86_64-elf.
  **Build**
  `docker build buildenv -t`*`<tagname of your choosing>`*
  **Deploy Container**
    - Linux/Mac OSX
  `docker run --rm -it -v $pwd:/root/env`*`<tagname of container from build step above>`*
     - Windows
  `docker run --rm -it -v %cd%:/root/env`*`<tagname of container from build step above>`*
- QEMU
  - Allows me to emulate my OS instead of going through the hassle of installing it on my computer or loading it on a USB. 
