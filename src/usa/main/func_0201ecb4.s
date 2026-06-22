; func_0201ecb4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_PostLocked
        .global func_0201ecb4
        .arm
func_0201ecb4:
    mov r1, #0x54
    mul r1, r0, r1
    mov r0, r1
    ldr ip, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bx ip
_LIT0: .word Task_PostLocked
