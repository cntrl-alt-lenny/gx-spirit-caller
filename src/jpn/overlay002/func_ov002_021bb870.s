; func_ov002_021bb870 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021ba024
        .global func_ov002_021bb870
        .arm
func_ov002_021bb870:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r4, r0
    ldr r3, _LIT0
    ldr r0, _LIT1
    and r2, r4, #0x1
    mla r7, r2, r0, r3
    mov r6, #0x0
    mov r8, r1
    mov r5, r6
.L_24:
    mov r0, r4
    mov r1, r5
    mov r2, r8
    bl func_ov002_021ba024
    cmp r0, #0x0
    ldrneh r0, [r7, #0x38]
    add r5, r5, #0x1
    add r7, r7, #0x14
    cmpne r0, #0x0
    addne r6, r6, #0x1
    cmp r5, #0xa
    ble .L_24
    mov r0, r6
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
