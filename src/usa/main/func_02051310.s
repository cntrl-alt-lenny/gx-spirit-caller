; func_02051310 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dbac
        .extern func_02049868
        .extern func_0204987c
        .extern func_0204ab14
        .extern func_0204f29c
        .extern func_0204f7ac
        .extern func_020515a4
        .global func_02051310
        .arm
func_02051310:
    stmdb sp!, {r4, lr}
    mov lr, r1
    mov ip, r2
    mov r4, r3
    mov r1, r0
    mov r2, lr
    mov r3, ip
    mov r0, #0x2
    bl func_0204f29c
    bl func_0204987c
    str r4, [r0, #0x464]
    bl func_0204987c
    ldr r1, [sp, #0x8]
    str r1, [r0, #0x468]
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldr r0, [r0, #0x1f8]
    str r0, [r4, #0xf4]
    bl func_0204987c
    mov r1, #0x1
    str r1, [r0, #0x2e8]
    bl func_0204987c
    mov r2, #0x0
    strb r2, [r0, #0xe]
    ldr r1, _LIT0
    mov r0, #0xa
    strb r2, [r1, #0x1]
    bl func_02049868
    bl func_0204f7ac
    bl func_0204ab14
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    bl func_0204987c
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    bl func_0204987c
    ldr r0, [r0, #0x1f8]
    bl func_020515a4
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219dbac
