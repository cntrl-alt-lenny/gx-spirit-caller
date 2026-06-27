; func_ov002_021c2f28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a0
        .extern func_ov002_021b3ef8
        .global func_ov002_021c2f28
        .arm
func_ov002_021c2f28:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov sl, r0
    ldr r0, _LIT0
    and r3, sl, #0x1
    mul r2, r3, r0
    ldr r0, _LIT1
    mov r6, #0x0
    ldr r0, [r0, r2]
    mov r9, r1
    mov r5, r6
    cmp r0, #0x0
    bls .L_a0
    ldr r0, _LIT2
    mov r4, #0xb
    add r8, r0, r2
    add r0, r8, #0x18
    add r7, r0, #0x400
.L_44:
    ldr r1, [r7]
    mov r0, r1, lsl #0x13
    cmp r9, r0, lsr #0x13
    bne .L_8c
    mov r0, r1, lsl #0xa
    movs r0, r0, lsr #0x1f
    bne .L_8c
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov ip, r1, lsl #0x12
    mov r3, r0, lsl #0x1
    mov r0, sl
    mov r1, r4
    mov r2, r9
    add r3, r3, ip, lsr #0x1f
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    addeq r6, r6, #0x1
.L_8c:
    ldr r0, [r8, #0x14]
    add r5, r5, #0x1
    cmp r5, r0
    add r7, r7, #0x4
    bcc .L_44
.L_a0:
    mov r0, r6
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a0
_LIT2: .word data_ov002_022cf08c
