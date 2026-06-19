; func_ov002_022a822c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cc32c
        .extern data_ov002_022cc348
        .extern data_ov002_022d1a9c
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_ov002_022ae718
        .global func_ov002_022a822c
        .arm
func_ov002_022a822c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x28
    add r0, sp, #0x0
    bl func_0201d47c
    ldr r0, _LIT0
    bl func_ov002_022ae718
    cmp r0, #0x0
    mov r1, #0x4
    mov r2, #0x0
    beq .L_46c
    ldr r0, _LIT1
    bl func_02006c0c
    mvn r1, #0x0
    mov r4, r0
    strh r1, [sp, #0x10]
    b .L_480
.L_46c:
    ldr r0, _LIT2
    bl func_02006c0c
    mov r1, #0x60
    mov r4, r0
    strh r1, [sp, #0x10]
.L_480:
    ldrh r2, [sp, #0x14]
    ldr r1, _LIT3
    add r0, sp, #0x0
    bic r2, r2, #0xf
    orr r2, r2, #0x9
    str r4, [sp]
    strh r2, [sp, #0x14]
    str r1, [sp, #0xc]
    bl func_0201e5b8
    mov r0, r4
    bl func_02006e1c
    add sp, sp, #0x28
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d1a9c
_LIT1: .word data_ov002_022cc32c
_LIT2: .word data_ov002_022cc348
_LIT3: .word 0x0000b980
