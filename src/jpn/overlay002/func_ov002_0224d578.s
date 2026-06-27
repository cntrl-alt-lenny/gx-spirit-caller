; func_ov002_0224d578 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a0
        .extern func_0202b8fc
        .extern func_0202e1e0
        .extern func_ov002_021b9048
        .extern func_ov002_02253370
        .global func_ov002_0224d578
        .arm
func_ov002_0224d578:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r1, _LIT0
    and r0, sl, #0x1
    mul r2, r0, r1
    ldr r0, _LIT1
    mov r6, #0x0
    ldr r0, [r0, r2]
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT2
    sub r4, r1, #0x28c
    add r9, r0, r2
    add r0, r9, #0x18
    add r8, r0, #0x400
    mov fp, #0xe
    mov r5, #0x3
.L_44:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r7, r0, lsr #0x13
    mov r0, r7
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_94
    mov r0, r7
    bl func_0202b8fc
    cmp r0, r4
    bgt .L_94
    mov r0, r7
    mov r1, r5
    bl func_ov002_021b9048
    cmp r0, #0x0
    beq .L_94
    mov r0, sl
    mov r1, fp
    mov r2, r6
    bl func_ov002_02253370
.L_94:
    ldr r0, [r9, #0x14]
    add r6, r6, #0x1
    cmp r6, r0
    add r8, r8, #0x4
    bcc .L_44
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a0
_LIT2: .word data_ov002_022cf08c
