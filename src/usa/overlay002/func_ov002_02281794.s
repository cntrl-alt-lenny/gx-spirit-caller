; func_ov002_02281794 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cb8a8
        .extern data_ov002_022cf08c
        .global func_ov002_02281794
        .arm
func_ov002_02281794:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    ldr r1, _LIT1
    and r0, r0, #0x1
    mla ip, r0, r1, r2
    mov lr, #0x0
    ldr r4, [ip, #0xc]
    ldr r2, _LIT2
    mov r3, lr
.L_5bc:
    mov r0, r3
    cmp r4, #0x0
    bls .L_5f4
    mov r1, lr, lsl #0x1
    ldrh r6, [r2, r1]
    add r5, ip, #0x120
.L_5d4:
    ldr r1, [r5]
    mov r1, r1, lsl #0x13
    cmp r6, r1, lsr #0x13
    ldmeqia sp!, {r4, r5, r6, pc}
    add r0, r0, #0x1
    cmp r0, r4
    add r5, r5, #0x4
    bcc .L_5d4
.L_5f4:
    add lr, lr, #0x1
    cmp lr, #0x19
    bcc .L_5bc
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cb8a8
