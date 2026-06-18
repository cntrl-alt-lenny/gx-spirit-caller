; func_ov002_02246f68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern func_0202e234
        .extern func_ov002_021c38c4
        .global func_ov002_02246f68
        .arm
func_ov002_02246f68:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov fp, r0
    ldr r0, _LIT0
    and r3, fp, #0x1
    mul r2, r3, r0
    ldr r0, _LIT1
    mov r5, #0x0
    ldr r0, [r0, r2]
    mov sl, r1
    mov r6, r5
    cmp r0, #0x0
    bls .L_1340
    ldr r0, _LIT2
    mvn r4, #0x0
    add r9, r0, r2
    add r8, r9, #0x120
.L_12e0:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r7, r0, lsr #0x13
    mov r0, r7
    bl func_0202e234
    cmp r0, #0x0
    beq .L_132c
    cmp r7, sl
    moveq sl, r4
    beq .L_132c
    ldr r2, [r8]
    mov r0, fp
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021c38c4
    add r5, r5, r0
.L_132c:
    ldr r0, [r9, #0xc]
    add r6, r6, #0x1
    cmp r6, r0
    add r8, r8, #0x4
    bcc .L_12e0
.L_1340:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf178
_LIT2: .word data_ov002_022cf16c
