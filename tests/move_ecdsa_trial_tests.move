
#[test_only]
module move_ecdsa_trial::move_ecdsa_trial_tests {
    use move_ecdsa_trial::move_ecdsa_trial::ecrecover_to_eth_address;
    use sui::hash::keccak256;
    use std::string::bytes;
    #[test]
    fun test_recover() {
        let mut identifier = b"0xd1dcfc5338cb588396e44e6449e8c750bd4d76332c7e9440c92383382fced0fd".to_string();
        let mut owner = b"0x13239fc6bf3847dfedaf067968141ec0363ca42f".to_string();
        let mut timestamp = b"1712174155".to_string();
        let epoch = b"1".to_string();

        let endl = b"\n".to_string();
        
        identifier.append(endl);
        owner.append(endl);
        timestamp.append(endl);

        let mut message = b"".to_string();
        message.append(identifier);
        message.append(owner);
        message.append(timestamp);
        message.append(epoch);
    

        let mut eth_msg = b"\x19Ethereum Signed Message:\n".to_string();
        let mut len = b"";
        len.push_back(message.length() as u8);
        let string_len = len.to_string();
        eth_msg.append(string_len);
        eth_msg.append(message);

        // let hasher = keccak256(bytes(&eth_msg));

        let signature = b"0x2888485f650f8ed02d18e32dd9a1512ca05feb83fc2cbf2df72fd8aa4246c5ee541fa53875c70eb64d3de9143446229a250c7a762202b7cc289ed31b74b31c811c";
        
        let addr = ecrecover_to_eth_address(signature, *bytes(&eth_msg));


        assert!(addr == b"0x244897572368eadf65bfbc5aec98d8e5443a9072", 0);
    }  
}

