; func_ov002_02267d14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf178
        .extern func_ov002_021baca8
        .extern func_ov002_021de480
        .global func_ov002_02267d14
        .arm
func_ov002_02267d14:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r0, _LIT0
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT1
    ldr r0, [r0, r2]
    cmp r0, #0x4
    bhi .L_17c
    mov r6, #0x5
    mov r5, #0x1540
.L_13c:
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_170
    mov r2, #0x0
    mov r0, r4
    mov r1, r6
    mov r3, r2
    bl func_ov002_021de480
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_170:
    add r6, r6, #0x1
    cmp r6, #0xa
    blt .L_13c
.L_17c:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf178
