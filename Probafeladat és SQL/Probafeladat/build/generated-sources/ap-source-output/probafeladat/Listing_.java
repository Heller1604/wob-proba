package probafeladat;

import java.math.BigDecimal;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-08-23T18:29:42")
@StaticMetamodel(Listing.class)
public class Listing_ { 

    public static volatile SingularAttribute<Listing, Integer> marketplaceId;
    public static volatile SingularAttribute<Listing, BigDecimal> listingPrice;
    public static volatile SingularAttribute<Listing, Integer> quantity;
    public static volatile SingularAttribute<Listing, Integer> statusId;
    public static volatile SingularAttribute<Listing, String> locationId;
    public static volatile SingularAttribute<Listing, String> description;
    public static volatile SingularAttribute<Listing, String> currency;
    public static volatile SingularAttribute<Listing, String> id;
    public static volatile SingularAttribute<Listing, String> title;
    public static volatile SingularAttribute<Listing, Date> uploadTime;
    public static volatile SingularAttribute<Listing, String> ownerEmail;

}