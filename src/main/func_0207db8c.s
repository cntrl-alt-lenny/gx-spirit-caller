; func_0207db8c — brief 655 review: no duplicate-address evidence.
; Taxonomy citation removed; never assessed as a C-match target.

        .text
        .extern Fill32
        .global func_0207db8c
        .arm
func_0207db8c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r3, [r5, #0x4]
    sub r0, r2, #0x1
    mvn r2, r0
    sub r1, r3, r1
    ldr r0, [r5, #0x0]
    and r4, r2, r1
    cmp r4, r0
    addlo sp, sp, #0x4
    movlo r0, #0x0
    ldmloia sp!, {r4, r5, pc}
    ldr r0, [r5, #-0x4]
    sub r2, r3, r4
    and r0, r0, #0xff
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    ands r0, r0, #0x1
    beq .L_0207dbe8
    mov r1, r4
    mov r0, #0x0
    bl Fill32
.L_0207dbe8:
    mov r0, r4
    str r4, [r5, #0x4]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
