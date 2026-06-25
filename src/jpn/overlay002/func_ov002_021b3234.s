; func_ov002_021b3234 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c6
        .extern data_ov002_022d0570
        .global func_ov002_021b3234
        .arm
func_ov002_021b3234:
    stmdb sp!, {r4, r5, r6, lr}
    ldr ip, _LIT0
    mov r2, #0x14
    ldr r3, _LIT1
    and r4, r0, #0x1
    mul r2, r1, r2
    mla r0, r4, ip, r3
    ldrh r2, [r2, r0]
    mov r0, #0x0
    cmp r2, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r5, _LIT2
    ldr r1, _LIT3
    mov r3, #0x14
.L_10c:
    add r6, r1, r2, lsl #0x3
    ldrh r4, [r6, #0x2]
    ldrh r2, [r6, #0x6]
    mov r4, r4, lsl #0x1c
    mov r4, r4, lsr #0x1c
    cmp r4, #0xa
    bcc .L_154
    ldrh r6, [r6]
    and r4, r6, #0xff
    and r4, r4, #0x1
    mla lr, r4, ip, r5
    mov r4, r6, asr #0x8
    and r4, r4, #0xff
    mla lr, r4, r3, lr
    ldr lr, [lr, #0x30]
    mov r4, lr, lsl #0x13
    movs r4, r4, lsr #0x13
    addne r0, r0, #0x1
.L_154:
    cmp r2, #0x0
    bne .L_10c
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c6
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022d0570
