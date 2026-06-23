; func_02005488 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02001cec
        .extern func_02003af4
        .extern func_02004ed8
        .global func_02005488
        .arm
func_02005488:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x40
    mov r5, r0
    mov r4, r1
    add r0, sp, #0xc
    mov r1, #0x80
    mov r2, #0x2
    bl func_02001cec
    mov r2, #0x0
    ldr ip, _LIT0
    add r0, sp, #0xc
    stmia sp, {r2, r4, ip}
    mov r1, r5
    mov r3, r2
    bl func_02004ed8
    ldr r0, [sp, #0x14]
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word func_02003af4
