public class zoom_token {
   Public Static String createToken() {

        String alg = 'HS256';
        String typ = 'JWT'; 
        String iss = 'A45ERT6bQxqx-LWimIEtAg';
        String exp = String.valueOf(System.currentTimeMillis());
       
         System.debug('exp'+exp);
        String headerJson = JSON.serialize(new Header(alg,typ));
        String bodyJson =  JSON.serialize(new Body(iss,exp));

        String token = EncodingUtil.base64Encode(Blob.valueOf(headerJson))
                + '.' + EncodingUtil.base64Encode(Blob.valueOf(bodyJson));
        String signature = EncodingUtil.base64Encode(Crypto.generateMac(
                'HmacSHA256',
                Blob.valueOf(token),
                Blob.valueOf('HFDZ6CUhkB7PTLZYvBjus0Ts1yh29mAJtX3n')
                ));
        token += '.' + signature;
		System.debug('token'+token);
        return token;
    }
  
    private class Header {
        String alg;
        String typ;
        Header(String alg,String typ) {
            this.alg = alg;
            this.typ = typ;
        }
    }
    
    private class Body {
        String iss;
        String exp;
        Body(String iss, String exp) {
            this.iss = iss;
            this.exp = exp;
        }
    }
}