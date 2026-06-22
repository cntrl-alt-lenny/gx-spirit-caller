; func_02031f1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02031f1c
        .arm
func_02031f1c:
    stmdb sp!, {r3, lr}
    mov lr, r0
    ldr ip, [lr, #0x20]
    cmp ip, #0x0
    ldmeqia sp!, {r3, pc}
    ldrh r2, [lr, #0xc]
    mov r0, r1
    ldrh r3, [lr, #0xe]
    ldr r1, [lr, #0x8]
    blx ip
    ldmia sp!, {r3, pc}
