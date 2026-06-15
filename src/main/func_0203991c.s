; func_0203991c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b2f2
        .extern data_0219b300
        .extern data_0219b30c
        .extern data_0219c480
        .extern func_0203a104
        .extern func_02091a8c
        .extern func_02091cf8
        .global func_0203991c
        .arm
func_0203991c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r4, _LIT0
    ldr r5, _LIT1
    ldr r7, _LIT2
    ldr r6, _LIT3
    mov r8, #0x0
.L_c9c:
    ldrh r0, [r7]
    tst r0, #0x4
    beq .L_cb4
    bic r0, r0, #0x4
    strh r0, [r7]
    bl func_02091cf8
.L_cb4:
    bl func_0203a104
    and r1, r0, #0x1
    strh r1, [r6, #0x2]
    cmp r0, #0x0
    bne .L_c9c
    ldr r1, [r5]
    cmp r1, #0x0
    beq .L_cdc
    ldr r0, [r4]
    blx r1
.L_cdc:
    mov r0, r8
    bl func_02091a8c
    b .L_c9c
_LIT0: .word data_0219b30c
_LIT1: .word data_0219b300
_LIT2: .word data_0219b2f2
_LIT3: .word data_0219c480
