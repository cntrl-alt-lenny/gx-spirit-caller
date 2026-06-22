; func_020b3554 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b3554
        .arm
func_020b3554:
    stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
    mov r4, r1
    orr r4, r4, #0x1
    .word 0xea000003
