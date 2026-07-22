; func_02000f84 — brief 655 review: no duplicate-address evidence.
; Taxonomy citation removed; never assessed as a C-match target.

        .text
        .extern data_02102c60
        .extern data_021040ac
        .extern func_02000c4c
        .global func_02000f84
        .arm
func_02000f84:
    stmdb sp!, {r3, lr}
    ldr r1, .L_02000fc0
    ldr r0, [r1, #0xb64]
    add r0, r0, #0x1
    str r0, [r1, #0xb64]
    bl func_02000c4c
    ldr r2, .L_02000fc4
    ldr r1, .L_02000fc0
    str r0, [r2, #0x0]
    mov r0, #0x0
    str r0, [r1, #0xb6c]
    str r0, [r1, #0xb70]
    str r0, [r1, #0xb74]
    str r0, [r1, #0xb78]
    ldmia sp!, {r3, pc}
.L_02000fc0:
        .word   data_021040ac
.L_02000fc4:
        .word   data_02102c60
