        .text
        .extern func_0209aa84
        .global func_0209aa64
        .arm
func_0209aa64:
    ldr ip, .L_0209aa80
    mov r1, #0x0
    cmp r0, #0x1
    movne r0, #0x0
    mov r2, r1
    mov r3, #0x1
    bx ip
.L_0209aa80: .word func_0209aa84
