; func_ov015_021b30f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov015_021b2b80
        .global func_ov015_021b30f0
        .arm
func_ov015_021b30f0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_ov015_021b2b80
    ldrsh lr, [r6, #0x6]
    ldrsh r2, [r6]
    ldrsh r1, [r6, #0x2]
    mov r7, #0x0
    cmp lr, #0x0
    add r1, r2, r1, lsl #0x5
    add r3, r0, r1, lsl #0x1
    ldrsh ip, [r6, #0x4]
    ldmleia sp!, {r3, r4, r5, r6, r7, pc}
    rsb r2, ip, #0x20
    mov r1, r7
.L_40:
    mov r6, r1
    cmp ip, #0x0
    ble .L_64
.L_4c:
    orr r0, r5, r4, lsl #0xc
    add r6, r6, #0x1
    cmp r6, ip
    strh r0, [r3], #0x2
    add r5, r5, #0x1
    blt .L_4c
.L_64:
    add r7, r7, #0x1
    cmp r7, lr
    add r3, r3, r2, lsl #0x1
    blt .L_40
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
