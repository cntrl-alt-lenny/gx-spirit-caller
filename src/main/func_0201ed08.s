        .text
        .extern Task_PostLocked
        .global func_0201ed08
        .arm
func_0201ed08:
    mov r1, #0x54
    mul r1, r0, r1
    mov r0, r1
    ldr ip, .L_0201ed24
    mov r1, #0x4
    mov r2, #0x0
    bx ip
.L_0201ed24: .word Task_PostLocked
