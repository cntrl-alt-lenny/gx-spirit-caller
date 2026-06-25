; func_ov002_022b2e78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_022b2e78
        .arm
func_ov002_022b2e78:
    mov r1, #0x1
    mov r2, #0x0
    stmia r0, {r1, r2}
    str r2, [r0, #0x60]
    str r2, [r0, #0x8]
    str r2, [r0, #0x24]
    str r2, [r0, #0x28]
    str r2, [r0, #0x3c]
    str r2, [r0, #0x40]
    str r2, [r0, #0x34]
    str r2, [r0, #0x38]
    str r2, [r0, #0x44]
    str r2, [r0, #0x48]
    str r2, [r0, #0x4c]
    str r2, [r0, #0x50]
    sub r1, r2, #0x1
    str r1, [r0, #0x58]
    str r2, [r0, #0x54]
    str r1, [r0, #0xc]
    str r2, [r0, #0x1c]
    mov r1, #0x7
    str r1, [r0, #0x10]
    str r1, [r0, #0x14]
    str r2, [r0, #0x68]
    bx lr
