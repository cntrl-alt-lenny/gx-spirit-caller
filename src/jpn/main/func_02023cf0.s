; func_02023cf0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02023cf0
        .arm
func_02023cf0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    movs lr, r1
    addne r0, r4, #0x68
    mov ip, r2
    ldmneia r0, {r0, r1, r2}
    stmneia lr, {r0, r1, r2}
    cmp ip, #0x0
    addne r0, r4, #0x74
    ldmneia r0, {r0, r1, r2}
    stmneia ip, {r0, r1, r2}
    cmp r3, #0x0
    addne r0, r4, #0x80
    ldmneia r0, {r0, r1, r2}
    stmneia r3, {r0, r1, r2}
    mov r0, #0x1
    ldmia sp!, {r4, pc}
