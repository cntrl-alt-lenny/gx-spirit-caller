; func_02013a64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02019664
        .extern func_0201969c
        .global func_02013a64
        .arm
func_02013a64:
    stmdb sp!, {r4, lr}
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x91c]
    cmp r0, #0x2
    ldmhiia sp!, {r4, pc}
    bl func_02019664
    cmp r0, #0x6a
    ldmneia sp!, {r4, pc}
    bl func_0201969c
    cmp r0, #0x4
    ldreq r0, [r4, #0x8f8]
    orreq r0, r0, #0x100
    streq r0, [r4, #0x8f8]
    ldmia sp!, {r4, pc}
