; func_ov002_022a80f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cc238
        .extern data_ov002_022cc254
        .extern data_ov002_022d19bc
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_ov002_022ae5dc
        .global func_ov002_022a80f0
        .arm
func_ov002_022a80f0:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x28
    add r0, sp, #0x0
    bl func_0201d428
    ldr r0, _LIT0
    bl func_ov002_022ae5dc
    cmp r0, #0x0
    mov r1, #0x4
    mov r2, #0x0
    beq .L_1218
    ldr r0, _LIT1
    bl func_02006bf0
    mvn r1, #0x0
    mov r4, r0
    strh r1, [sp, #0x10]
    b .L_122c
.L_1218:
    ldr r0, _LIT2
    bl func_02006bf0
    mov r1, #0x60
    mov r4, r0
    strh r1, [sp, #0x10]
.L_122c:
    ldrh r2, [sp, #0x14]
    ldr r1, _LIT3
    add r0, sp, #0x0
    bic r2, r2, #0xf
    orr r2, r2, #0x9
    str r4, [sp]
    strh r2, [sp, #0x14]
    str r1, [sp, #0xc]
    bl func_0201e564
    mov r0, r4
    bl func_02006e00
    add sp, sp, #0x28
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d19bc
_LIT1: .word data_ov002_022cc238
_LIT2: .word data_ov002_022cc254
_LIT3: .word 0x0000b980
