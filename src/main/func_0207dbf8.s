; func_0207dbf8 — brief 655 review: no duplicate-address evidence.
; Taxonomy citation removed; never assessed as a C-match target.

        .text
        .extern Fill32
        .global func_0207dbf8
        .arm
func_0207dbf8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0x0]
    sub r2, r2, #0x1
    mvn r3, r2
    add r2, r2, r0
    and r5, r3, r2
    ldr r2, [r6, #0x4]
    add r4, r1, r5
    cmp r4, r2
    movhi r0, #0x0
    ldmhiia sp!, {r4, r5, r6, pc}
    ldr r1, [r6, #-0x4]
    sub r2, r4, r0
    and r1, r1, #0xff
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    ands r1, r1, #0x1
    beq .L_0207dc50
    mov r1, r0
    mov r0, #0x0
    bl Fill32
.L_0207dc50:
    mov r0, r5
    str r4, [r6, #0x0]
    ldmia sp!, {r4, r5, r6, pc}
