; func_ov002_021c2eac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern func_ov002_021b91f8
        .global func_ov002_021c2eac
        .arm
func_ov002_021c2eac:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, _LIT0
    and r0, r0, #0x1
    mul r2, r0, r2
    ldr r0, _LIT1
    mov r4, r1
    ldr r0, [r0, r2]
    mov r5, #0x0
    cmp r0, #0x0
    bls .L_1dc
    ldr r0, _LIT2
    add r7, r0, r2
    add r0, r7, #0x18
    add r6, r0, #0x400
.L_1b0:
    mov r0, r6
    mov r1, r4
    bl func_ov002_021b91f8
    cmp r0, #0x0
    addne r0, r5, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r7, #0x14]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x4
    bcc .L_1b0
.L_1dc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf180
_LIT2: .word data_ov002_022cf16c
