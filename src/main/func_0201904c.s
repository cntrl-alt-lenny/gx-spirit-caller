; func_0201904c — brief 655 review: no duplicate-address evidence.
; Taxonomy citation removed; never assessed as a C-match target.

        .text
        .extern GetSystemWork
        .global func_0201904c
        .arm
func_0201904c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GetSystemWork
    ldr r2, [r0, #0x8d4]
    ldr r1, .L_02019084
    mov r3, r2, lsl #0x10
    add r3, r4, r3, lsr #0x10
    and r2, r2, r1, lsl #0x10
    cmp r3, r1
    orrhi r1, r2, r1
    movls r1, r3, lsl #0x10
    orrls r1, r2, r1, lsr #0x10
    str r1, [r0, #0x8d4]
    ldmia sp!, {r4, pc}
.L_02019084:
        .word   0xffff
