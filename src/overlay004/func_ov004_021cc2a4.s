; func_ov004_021cc2a4 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b500
        .extern func_0201cd1c
        .extern func_02037208
        .global func_ov004_021cc2a4
        .arm
func_ov004_021cc2a4:
    stmdb sp!, {r3, lr}
    mov r0, #0x2
    mov r3, #0x13
    add r1, sp, #0x0
    mov r2, r0
    strh r3, [sp]
    bl func_0201cd1c
    mov r0, #0x42
    ldr ip, _LIT0
    mov r2, #0x0
    str r2, [ip, #0x74]
    ldr r3, [ip, #0x54]
    sub r1, r0, #0x43
    sub lr, r3, #0x1
    mov r3, #0x1
    str lr, [ip, #0x54]
    bl func_02037208
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov004_0220b500
