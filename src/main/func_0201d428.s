; func_0201d428 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0218febc
        .extern func_0200583c
        .extern func_0201cf88
        .extern func_0201d150
        .extern func_0202043c
        .extern func_0202046c
        .extern func_02093820
        .global func_0201d428
        .arm
func_0201d428:
    stmdb sp!, {r3, lr}
    mov r0, #0x0
    bl func_0202043c
    mov r0, #0x0
    bl func_0200583c
    bl func_0201cf88
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0x14]
    bl func_0201d150
    bl func_0202046c
    cmp r0, #0x3
    ldmneia sp!, {r3, pc}
.L_3c:
    bl func_02093820
    bl func_0202046c
    cmp r0, #0x3
    beq .L_3c
    ldmia sp!, {r3, pc}
_LIT0: .word data_0218febc
