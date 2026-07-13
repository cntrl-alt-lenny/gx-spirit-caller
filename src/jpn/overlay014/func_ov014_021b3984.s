; func_ov014_021b3984 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .global func_ov014_021b3984
        .arm
func_ov014_021b3984:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r0, _LIT0
    cmp r3, #0x0
    ldr r4, [r0, #0x38]
    mov r0, #0x0
    and ip, r4, #0x3f
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r6, #0x1f
    rsb r4, ip, #0x40
    mov r5, r6
.L_544:
    ldrh r8, [r2]
    cmp ip, #0x20
    mov r9, r8, asr #0x5
    bge .L_594
    mov r7, r8, asr #0xa
    and r8, r8, #0x1f
    and fp, r9, #0x1f
    rsb sl, r8, #0x1f
    and r9, r7, #0x1f
    mul r7, sl, ip
    rsb lr, fp, #0x1f
    mul sl, lr, ip
    mov lr, r7, asr #0x4
    add r7, r7, lr, lsr #0x1b
    add r8, r8, r7, asr #0x5
    mov r8, r8, lsl #0x10
    rsb r7, r9, #0x1f
    mov lr, r8, lsr #0x10
    mul r8, r7, ip
    b .L_5d0
.L_594:
    mov r7, r8, asr #0xa
    and r8, r8, #0x1f
    and fp, r9, #0x1f
    rsb sl, r8, #0x1f
    and r9, r7, #0x1f
    mul r7, sl, r4
    rsb lr, fp, #0x1f
    mul sl, lr, r4
    mov lr, r7, asr #0x4
    add r7, r7, lr, lsr #0x1b
    add r8, r8, r7, asr #0x5
    mov r8, r8, lsl #0x10
    rsb r7, r9, #0x1f
    mov lr, r8, lsr #0x10
    mul r8, r7, r4
.L_5d0:
    mov r7, sl, asr #0x4
    add r7, sl, r7, lsr #0x1b
    mov sl, r8, asr #0x4
    add r7, fp, r7, asr #0x5
    add r8, r8, sl, lsr #0x1b
    add r8, r9, r8, asr #0x5
    mov r7, r7, lsl #0x10
    mov r8, r8, lsl #0x10
    cmp lr, #0x1f
    mov r7, r7, lsr #0x10
    movhi lr, r6
    cmp r7, #0x1f
    movhi r7, r5
    mov r8, r8, lsr #0x10
    cmp r8, #0x1f
    movhi r8, #0x1f
    orr r7, lr, r7, lsl #0x5
    orr r7, r7, r8, lsl #0xa
    add r0, r0, #0x1
    cmp r0, r3
    strh r7, [r1], #0x2
    add r2, r2, #0x2
    blt .L_544
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02103fcc
