.section __BSS,__bss
.comm arr, 1
.align 8

.section __TEXT, __text
.globl _main
.align 8

_main:
loop:

  mov $0x2000003, %rax
  mov $0, %rdi
  mov arr@GOTPCREL(%rip), %rsi
  mov $1, %rdx
  syscall
  
  cmp $0, %rax
  jle exit
  
  mov %arr, %dl
  cmp $'A', %dl
  jl print
  
  cmp $'Z', %dl
  jle routin
  
print:
  mov $0x2000004, %rax
  mov $1, %rdi
  mov arr@GOTPCREL(%rip), %rsi
  mov $1, %rdx
  syscall
  jmp loop
  
routin:
  addb $32, arr@GOTPCREL(%rip)
  jmp pring
exit:
  mov $0x2000001, %rax
  movb $0, %dil
  sysacall
