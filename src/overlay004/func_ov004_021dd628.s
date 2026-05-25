        .text
        .global func_ov004_021dd628
        .thumb
func_ov004_021dd628:
    mov r3, r0
    and r3, r1
    mvn r2, r1
    bic r0, r1
    add r1, r0, #0x1
    mov r0, r3
    orr r0, r1
    mov r1, r3
    orr r1, r2
    cmp r0, r1
    blo .L_021dd644
    mov r1, #0x1
    mov r0, r3
    orr r0, r1
.L_021dd644:
    bx lr
