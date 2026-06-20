; func_ov002_021bd110 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202b8c0
        .extern func_ov002_021bb068
        .extern func_ov002_021bbeac
        .extern func_ov002_021bd030
        .global func_ov002_021bd110
        .arm
func_ov002_021bd110:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, r1
    bl func_0202b8c0
    cmp r0, #0x2
    bne .L_64
    ldr r0, _LIT0
    bl func_ov002_021bb068
    cmp r0, #0x0
    beq .L_5c
    ldr r0, _LIT1
    ldr r1, _LIT2
    and r2, r4, #0x1
    mla r0, r2, r0, r1
    ldr r0, [r0, #0xf8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    bne .L_5c
    mov r0, r4
    bl func_ov002_021bbeac
    cmp r0, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r4, pc}
.L_5c:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_64:
    mov r0, r4
    bl func_ov002_021bd030
    cmp r0, #0x0
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x000016df
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
