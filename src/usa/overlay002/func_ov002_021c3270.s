; func_ov002_021c3270 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a8
        .extern func_0202e1e0
        .global func_ov002_021c3270
        .arm
func_ov002_021c3270:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r1, _LIT0
    and r0, r0, #0x1
    mul r1, r0, r1
    ldr r0, _LIT1
    mov r5, #0x0
    ldr r0, [r0, r1]
    mov r4, r5
    cmp r0, #0x0
    bls .L_80
    ldr r0, _LIT2
    add r7, r0, r1
    add r6, r7, #0x5d0
.L_34:
    add r0, r7, r4, lsl #0x1
    add r0, r0, #0x700
    ldrh r0, [r0, #0x88]
    and r0, r0, #0xff
    cmp r0, #0x40
    beq .L_54
    cmp r0, #0x80
    beq .L_6c
.L_54:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    addne r5, r5, #0x1
.L_6c:
    ldr r0, [r7, #0x1c]
    add r4, r4, #0x1
    cmp r4, r0
    add r6, r6, #0x4
    bcc .L_34
.L_80:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a8
_LIT2: .word data_ov002_022cf08c
