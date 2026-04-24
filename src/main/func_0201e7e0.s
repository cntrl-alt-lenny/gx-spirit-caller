; func_0201e7e0: no-op stub — `bx lr` only.
;
; Ships as .s because a bare `bx lr` with no prologue/return-value
; setup doesn't come out of C (mwcc always emits some form of
; function-body wrapper).

        .text
        .global func_0201e7e0
        .arm
func_0201e7e0:
        bx      lr
