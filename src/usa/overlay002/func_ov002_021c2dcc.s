; func_ov002_021c2dcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a0
        .extern func_ov002_021b9118
        .global func_ov002_021c2dcc
        .arm
func_ov002_021c2dcc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, _LIT0
    and r0, r0, #0x1
    mul r2, r0, r2
    ldr r0, _LIT1
    mov r4, r1
    ldr r0, [r0, r2]
    mov r5, #0x0
    cmp r0, #0x0
    bls .L_64
    ldr r0, _LIT2
    add r7, r0, r2
    add r0, r7, #0x18
    add r6, r0, #0x400
.L_38:
    mov r0, r6
    mov r1, r4
    bl func_ov002_021b9118
    cmp r0, #0x0
    addne r0, r5, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r7, #0x14]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x4
    bcc .L_38
.L_64:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a0
_LIT2: .word data_ov002_022cf08c
