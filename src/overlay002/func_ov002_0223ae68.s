; func_ov002_0223ae68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf178
        .extern func_ov002_021decac
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .extern func_ov002_0226af58
        .global func_ov002_0223ae68
        .arm
func_ov002_0223ae68:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7f
    beq .L_194
    cmp r1, #0x80
    bne .L_1d4
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_18c
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    and r5, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r6, r0, #0xff
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_18c
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_021decac
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_18c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_194:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    beq .L_1cc
    mov r1, #0x1
    mov r2, r1
    bl func_ov002_0226af58
.L_1cc:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_1d4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
