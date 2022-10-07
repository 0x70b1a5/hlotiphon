::  /+  *zig-sys-smart
/=  nft  /lib/zig/contracts/lib/nft
=,  nft
|_  =cart 
++  write
  |=  axn=action:sur
  ^-  chick
  ?-  -.axn
      %give           
    =+  (need (scry grain-id.axn))
    ::  caller must hold NFT, this contract must be lord
    =/  gift  (husk nft:sur - `me.cart `id.from.cart)
    ::  NFT must be transferrable
    ?>  transferrable.data.gift
    ::  hlotiphon must have a hlot and hist
    ?>  (~(has py properties.data.gift) %hlot)
    ?>  (~(has py properties.data.gift) %history)
    =:  
        ::  change holder to reflect new ownership
        holder.gift  to.axn
        ::  clear allowances
        allowances.data.gift  ~
        ::  get a 'random' new hlot
        properties.data.gift  %+  ~(jab py properties.data.gift)  
            %hlot
          |=  old=@t 
          ^-  @t
          (crip (scow %ud (mod to.axn 64)))
        ::  update history
        ::properties.data.gift  %+  ~(jab py properties.data.gift)
          ::  %history
          ::|=  history=@t
          ::^-  @t
          ::(crip (weld (trip history) (weld (scow %ud to.axn) " ")))
    ==
    (result [[%& gift] ~] ~ ~ ~)
    ::
      %take           (take:lib:nft cart axn)
      %set-allowance  (set-allowance:lib:nft cart axn)
      %mint           (mint:lib:nft cart axn)
      %deploy         (deploy:lib:nft cart axn)
  ==
:: 
++  read
  |_  =path
  ++  json
    ^-  ^json
    ?+    path  !!
        [%inspect @ ~]
      ?~  g=(scry (slav %ux i.t.path))  ~
      ?.  ?=(%& -.u.g)  ~
      ?^  item=((soft nft:sur:nft) data.p.u.g)
        (nft:enjs:lib:nft u.item)
      ?^  meta=((soft metadata:sur:nft) data.p.u.g)
        (metadata:enjs:lib:nft u.meta)
      ~
    ==
  ::
  ++  noun
    ~
  --
--
