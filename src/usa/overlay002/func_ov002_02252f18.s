; func_ov002_02252f18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202e1e0
        .extern func_ov002_021c97ac
        .extern func_ov002_02253370
        .global func_ov002_02252f18
        .arm
func_ov002_02252f18:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r4, #0xf
    mov fp, r0
    mov r8, #0x0
    mov r5, r4
.L_14:
    eor r6, fp, r8
    ldr r1, _LIT0
    ldr r0, _LIT1
    and r2, r6, #0x1
    mla sl, r2, r1, r0
    ldr r0, [sl, #0x1c]
    mov r7, #0x0
    cmp r0, #0x0
    bls .L_90
    add r9, sl, #0x5d0
.L_3c:
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_7c
    mov r0, r6
    mov r1, r5
    mov r2, r7
    bl func_ov002_021c97ac
    cmp r0, #0x0
    beq .L_7c
    mov r0, r6
    mov r1, r4
    mov r2, r7
    bl func_ov002_02253370
.L_7c:
    ldr r0, [sl, #0x1c]
    add r7, r7, #0x1
    cmp r7, r0
    add r9, r9, #0x4
    bcc .L_3c
.L_90:
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_14
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
