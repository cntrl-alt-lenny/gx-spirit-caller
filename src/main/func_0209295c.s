; func_0209295c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02090574
        .extern func_02090844
        .extern func_02090b54
        .extern func_02091e2c
        .extern func_02092ca0
        .extern func_02092d20
        .extern func_02093014
        .extern func_02093720
        .extern func_0209393c
        .extern func_02093acc
        .extern func_02094c70
        .extern func_02096228
        .extern func_0209b384
        .extern func_0209cae4
        .extern func_020a6444
        .global func_0209295c
        .arm
func_0209295c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_02092d20
    bl func_02096228
    bl func_02090b54
    bl func_02092ca0
    bl func_02090844
    bl func_02090574
    bl func_02093014
    bl func_02094c70
    bl func_02093720
    bl func_02093acc
    bl func_02091e2c
    bl func_0209393c
    bl func_020a6444
    bl func_0209cae4
    bl func_0209b384
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
