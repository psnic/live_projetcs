package security;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class SessionFixationProtectionCookie {
    protected final Log logger = LogFactory.getLog(getClass());
    public static final String COOKIE_NAME = "ActiveID";
}