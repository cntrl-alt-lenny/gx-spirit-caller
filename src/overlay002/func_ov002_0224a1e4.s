; func_ov002_0224a1e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf17c
        .extern data_ov002_022cf180
        .extern func_ov002_02253458
        .global func_ov002_0224a1e4
        .arm
func_ov002_0224a1e4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r0
    ldr r0, _LIT0
    and r1, r6, #0x1
    mul r5, r1, r0
    ldr r0, _LIT1
    mov r4, #0x0
    ldr r0, [r0, r5]
    cmp r0, #0x0
    bls .L_2d0
    ldr r0, _LIT2
    mov r7, #0xd
    add r8, r0, r5
.L_2b0:
    mov r0, r6
    mov r1, r7
    mov r2, r4
    bl func_ov002_02253458
    ldr r0, [r8, #0x10]
    add r4, r4, #0x1
    cmp r4, r0
    bcc .L_2b0
.L_2d0:
    ldr r0, _LIT3
    mov r4, #0x0
    ldr r0, [r0, r5]
    cmp r0, #0x0
    ldmlsia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT2
    add r7, r0, r5
    mov r5, #0xe
.L_2f0:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_02253458
    ldr r0, [r7, #0x14]
    add r4, r4, #0x1
    cmp r4, r0
    bcc .L_2f0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf17c
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cf180
