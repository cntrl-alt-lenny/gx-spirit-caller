; func_ov002_021b1490 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b13a8
        .extern func_ov002_0229cc0c
        .extern func_ov002_0229cc60
        .global func_ov002_021b1490
        .arm
func_ov002_021b1490:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x100
    mov ip, #0x0
    mov r5, r0
    sub r0, ip, #0x1
    add r4, ip, #0x1
    mov r6, r3
    strh r5, [sp]
    cmp r1, r0
    beq .L_120
    mov r3, r4, lsl #0x1
    add r0, sp, #0x0
    strh r1, [r0, r3]
    add r4, r4, #0x1
.L_120:
    cmp r6, #0x0
    ble .L_144
    add r0, sp, #0x0
    mov r1, r2
    mov r2, r6
    add r0, r0, r4, lsl #0x1
    bl func_ov002_0229cc60
    add r0, r6, #0x1
    add r4, r4, r0, lsr #0x1
.L_144:
    mov r0, r5
    mov r1, #0x1
    bl func_ov002_021b13a8
    add r0, sp, #0x0
    mov r1, r4, lsl #0x1
    bl func_ov002_0229cc0c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
