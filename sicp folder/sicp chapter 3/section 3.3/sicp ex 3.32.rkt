#lang sicp

;if the actions all happen at a certain time event, it makes sense for it
;to follow first in first out instead of any time order, as this was the
;original order already given to us. If it was last in first out, the
;outputs propagated by the action would change, as we executed the actions
;in a different order, resulting in wrong propagation of events.