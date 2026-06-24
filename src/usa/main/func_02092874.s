; func_02092874 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209048c
        .extern func_0209075c
        .extern func_02090a6c
        .extern func_02091d44
        .extern func_02092bb8
        .extern func_02092c38
        .extern func_02092f2c
        .extern func_02093638
        .extern func_02093848
        .extern func_020939d8
        .extern func_02094b7c
        .extern func_02096134
        .extern func_0209b290
        .extern func_0209c9f0
        .extern func_020a6350
        .global func_02092874
        .arm
func_02092874:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_02092c38
    bl func_02096134
    bl func_02090a6c
    bl func_02092bb8
    bl func_0209075c
    bl func_0209048c
    bl func_02092f2c
    bl func_02094b7c
    bl func_02093638
    bl func_020939d8
    bl func_02091d44
    bl func_02093848
    bl func_020a6350
    bl func_0209c9f0
    bl func_0209b290
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
